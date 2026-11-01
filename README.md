# devops-diplom

## 1. Terraform

Денег оставалось мало, и в целом были проблемы с доступностью у яндекса.

Растянул выполнение дипломной, в итоге сервера разбомбили :)

<img width="480" height="460" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/1_terraform_yc_availability_zones_statuses.jpg?raw=true" />

Поднял бекенд:

<img width="880" height="460" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/1_terraform_backend.jpg?raw=true" />

Поднял остальную инфру:

<img width="880" height="460" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/1_terraform_infra_done.jpg?raw=true" />

Поднял свои машины для k8s кластера (были проблемы с поднятием второго варианта из-за доступности зон)

Из ручных действий было только прокидывание ключей бакета в инфраструктуру.

## 2. K8S cluster

Делал через ansible - [инвентори который загружал в Kubespray](https://github.com/erant-netology-courses/devops-diplom/tree/main/ansible/inventory/mycluster). Подставлял вручную IP.

Все поднялось:

<img width="880" height="460" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/2_k8s_results.jpg?raw=true" />

## 3. Test App

[Репозиторий с приложением.](https://github.com/erant-netology-courses/devops-diplom-app)

Использовал Yandex registry:

<img width="880" height="460" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/3_image_in_registry.jpg?raw=true" />

## 4. Monitoring

[Манифесты k8s тут.](https://github.com/erant-netology-courses/devops-diplom/tree/main/k8s) Но ставил через Helm, поэтому секреты и некоторые другие вещи создавал вручную

Все нужное по мониторингу задеплоилось:

<img width="880" height="460" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/4_monitoring_deployed.jpg?raw=true" />

Все работает:

<img width="1280" height="860" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/4_app_deployed.jpg?raw=true" />

Обновил порты с 30080 на 80, видно на этом дашборде графаны в пути:

<img width="1280" height="860" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/4_grafana_dashboard.jpg?raw=true" />

## 5. Final

Использовал Github Actions. [Ссылка для приложения](https://github.com/erant-netology-courses/devops-diplom-app/actions) и [для инфраструктуры.](https://github.com/erant-netology-courses/devops-diplom/actions).

Вот до прохождения пайплайнов:

<img width="880" height="460" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/5_before_deploy_cicd.jpg?raw=true" />

Вот после прохождения пайплайнов, еще и yc registry:

<img width="880" height="460" alt="image" src="https://github.com/erant-netology-courses/devops-diplom/blob/main/5_updated_deployed.jpg?raw=true" />