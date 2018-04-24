require 'active_record'

ActiveRecord::Base.establish_connection(
                      adapter: 'mysql2',
                      host: DATABASE_HOST,
                      username: 'tester',
                      password: 'P4ssw0rd',
                      database: 'movietix'

)

