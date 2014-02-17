working_directory "/home/leal/site/fabsoft" # Local do projeto
pid "/home/leal/site/fabsoft/tmp/pids/server.pid" #Local do arquivo pid
stderr_path "/home/leal/site/fabsoft/log/unicorn.stderr.log" # Arquivo de log de Erro
stdout_path "/home/leal/site/fabsoft/log/unicorn.stdout.log" # Arquivo do log de saida
listen "/home/leal/site/fabsoft/tmp/unicorn.todo.sock" # Guarde Esse Nome* 
worker_processes 2
timeout 30 # Tempo de espera até entrar em timeout(pagina demorou muito para responder)