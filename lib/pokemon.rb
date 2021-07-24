class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:,name:,type:,db:)
        @id=id
        @name=name
        @type=type
        @db=db
    end

    def self.save(name, type, db)
        sql = <<-SQL
        insert into pokemon (name, type) values (?,?)
        SQL
        db.execute(sql,name,type)
    end

    def self.find(id_num,db)
        sql = <<-SQL
        select * from pokemon where id=?
        SQL
        poke_info = db.execute(sql,id_num).flatten
        Pokemon.new(id: poke_info[0], name: poke_info[1], type:poke_info[2], db: db)
    end

end
