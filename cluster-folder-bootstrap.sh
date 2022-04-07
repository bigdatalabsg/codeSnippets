hadoop fs -chmod g+w /tmp

hadoop fs -mkdir /user

hadoop fs -mkdir /user/hive/
hadoop fs -mkdir /user/hive/warehouse
hadoop fs -chmod g+w /user/hive/warehouse

hadoop fs -mkdir /user/spark
hadoop fs -mkdir /user/spark/logs
hadoop fs -mkdir /user/spark/applicationHistory

hadoop fs -mkdir /user/flink
hadoop fs -mkdir /user/flink/ha/
hadoop fs -mkdir /user/flink/flink-checkpoints
hadoop fs -mkdir /user/flink/flink-savepoints
hadoop fs -mkdir /user/flink/completed-jobs
#===================================================================
hadoop fs -mkdir /projects

hadoop fs -mkdir /projects/stocks
hadoop fs -mkdir /projects/stocks/stage
hadoop fs -mkdir /projects/stocks/stage/daily_prices
hadoop fs -mkdir /projects/stocks/stage/dividends

hadoop fs -mkdir /projects/movies
hadoop fs -mkdir /projects/movies/stage

hadoop fs -mkdir /projects/bank
hadoop fs -mkdir /projects/bank/stage

hadoop fs -mkdir /projects/flightinfo
hadoop fs -mkdir /projects/flightinfo/stage


