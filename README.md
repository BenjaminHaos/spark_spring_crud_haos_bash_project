[comment]: <> (The line below links to a file that is then served by rawgit.com. It can take time for changes to be reflected.)

<a><img src="https://rawgit.com/EntropyHaos/scripted_java_spark_framework/master/docs/assets/readme_file_title.svg"/></a>

***Version 1.11***

# WAT!?

A set of Bash scripts to generate boilerplate for a Java CRUD WebApp.

### Tech Utilized

* [Cloud9 Virtual IDE](https://c9.io/)
* [Java Spark Framework](http://sparkjava.com/)
* [Spring Framework](https://spring.io/)
* [MongoDB](https://www.mongodb.com/)
* [Maven Build Tools](https://maven.apache.org/)
* [GitFlow](https://github.com/nvie/gitflow)

# HOW!?

There are seve

### Demo the Scripts

```bash
git clone git@github.com:EntropyHaos/scripted_java_spark_framework.git tester
bash tester/z_haos/setup_c9_vm_for_java_spark.bash --no_prompt
bash mongodb_run.bash
bash tester/z_haos/bash_spark_framework_haos.bash --no_delete
cd a_build/
mvn spring-boot:run
```


# WHY!?

I needed a tool to quickly throw together a prototype for a class project that i knew would change as we realized new business requirements.

# WEN!?

Created in the Fall of 2016. Cleaned up for public consumption in March of 2017.

# WER!?

On Cloud9 while attending Carroll University.

# WHO!?

Benjamin Haos built this after figuring out [this](https://github.com/prashantban/Java-Spark-FTL).