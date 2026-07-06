## 📊 Проект: OBS in Docker (Observability Stack)

# 🎯 Цель проекта
Развертывание полного стека мониторинга с использованием микросервисной архитектуры на Docker для сбора, хранения и визуализации метрик, логов и трассировок.

# 🧩 Компоненты
Компонент	Роль	Порт(ы)
Alloy	Сбор метрик, логов и трассировок с хоста и Docker	-
Mimir	Долгосрочное хранение метрик (Prometheus-совместимый)	9009
Loki	Сбор и хранение логов (распределенный кластер)	3100
Tempo	Сбор и хранение трассировок (OTLP)	3200, 4317-4318
Grafana	Визуализация всех данных (единая панель)	3000
MinIO	S3-совместимое хранилище для всех сервисов	19000, 19001
PostgreSQL	База данных для Grafana	5432
Postgres Exporter	Сбор метрик PostgreSQL	9187

# 🔄 Потоки данных
Метрики: Alloy → Mimir → Grafana

Логи: Alloy → Loki → Grafana

Трассировки: Alloy → Tempo → Grafana

Хранилище: Все сервисы → MinIO (S3)

База данных: Grafana → PostgreSQL

# 🚀 Особенности
✅ Полный Observability Stack (Metrics + Logs + Traces)

✅ Распределенная архитектура (кластеры Loki и Mimir)

✅ S3-совместимое хранилище (MinIO)

✅ Единая точка входа (Grafana)

✅ Масштабируемость (каждый компонент можно масштабировать)

✅ Все в Docker (легкий деплой и управление)

# 📊 Технологии
Grafana LGTM Stack: Loki, Grafana, Tempo, Mimir

MinIO (S3 Storage)

PostgreSQL

Alloy (Grafana Agent)

Docker / Docker Compose

Prometheus Exporter (PostgreSQL)