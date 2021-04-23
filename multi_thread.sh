#!/usr/bin/env bash

# 定义start_time()获取开始执行时间
start_time() {
  time=$(date +"%F %T")
  printf "开始时间为: ${time}\n"
}

# 定义end_time()获取执行结束时间
end_time() {
  time=$(date +"%F %T")
  printf "结束时间为: ${time}\n"
}

# 定义task()任务打印当前时间
task() {
  printf "现在的时间是: $(date +"%F %T %N")\n"
}

main() {
  start_time

  # 使用{}&将任务放入后台交给操作系统线程执行
  for ((i=0;i<=100;i++));
    do
      {
        sleep 1s
        task;
      }&
    done

  # 等待放入后台执行完成后,在执行wait之后的语句
  wait

  end_time
}

# 执行主函数main()
main

# 通过执行main()函数得到的结果可以看出,线程返回结果时无序