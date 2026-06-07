# Отчет об анализе расхождений: iiot_monitoring vs Core (2026)

Этот документ фиксирует критические несоответствия между текущей реализацией мобильного приложения на Flutter и обновленным ядром системы (.NET Shared/WebApi/Database).

## 1. Фундаментальные изменения (Терминология)
**Статус:** Критично (Требуется рефакторинг имен).

| Старое (App) | Новое (Core) | Комментарий |
| :--- | :--- | :--- |
| `Sensor` | `Tag` | Основная сущность опроса теперь называется "Тег". |
| `sensorId` | `tagId` | Идентификатор в JSON изменился. |
| `sensorDataType` | `dataType` | |

## 2. Модели данных (Models / DTO)

### Device (Устройство)
*   **Сетевой слой:** В App IP и Порт находятся в модели устройства. В Core они вынесены в `ModbusConnection`.
*   **Статусы (Missing):** В App отсутствуют поля:
    *   `isOnline` (bool) — фактическая доступность.
    *   `lastSeen` (DateTime) — время последнего контакта.
    *   `lastConnError` (String) — текст ошибки.
*   **Конфиг:** Появились `useGroupPolling`, `maxRegisterSpan`, которых нет в App.

### Tag / Sensor (Тег)
*   **Масштабирование:** Полностью отсутствуют поля для линейной интерполяции: `inputMin/Max`, `outputMin/Max`.
*   **Modbus Config:** Отсутствуют поля `registerAddress`, `registerType`, `registerCount`, `endianness`. Даже если App их не отображает, DTO должен быть синхронизирован.

## 3. Real-time слой (SignalR & Metrics)
**Статус:** СИСТЕМА СЛОМАНА. Мобилка не будет получать данные.

*   **Триггер БД:** `fn_trigger_notify_metrics` в Postgres теперь отправляет JSON с ключами: `tagId`, `value`, `time`, `rawValue`.
*   **Flutter Metric:** Модель ожидает `SensorId`, `Value`, `Time` (с заглавной буквы и старым именем ID).
*   **Hub Connection:** В `signalr_service.dart` используется старый путь к хабу. Нужно проверить соответствие `app.MapHub<MonitoringHub>("/hubs/metrics")`.

## 4. Сериализация Enum
**Статус:** Критично.

В WebApi настроен `JsonStringEnumConverter(JsonNamingPolicy.SnakeCaseUpper)`.
Это означает, что вместо `AnalogRaw` будет приходить `ANALOG_RAW`.
*   **Необходимо:** Обновить все `@JsonValue` в Flutter-энумах.

## 5. API Эндпоинты
`DashboardDeviceDTO` в WebApi значительно расширен по сравнению с тем, что ожидает `device_repository.dart` в App. 
*   **Риск:** Ошибки парсинга JSON (Missing required fields или Type mismatch).

---
**Дата отчета:** 31 мая 2026 г.
**Рекомендация:** Начать с переименования сущностей и обновления моделей `Metric` и `Tag`.
