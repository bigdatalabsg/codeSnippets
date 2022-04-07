AIRFLOW_VERSION=2.2.0
PYTHON_VERSION="$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)"
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
PROVIDERS=apache-hdfs,apache-hive,apache-druid,apache-pinot,apache-spark,apache-sqoop,celery,http,google,elasticsearch,mysql,jdbc,postgres,presto,ssh,neo4j,apache-livy,jenkins,jira
pip install "apache-airflow[$PROVIDERS]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
