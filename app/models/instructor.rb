class Instructor
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_students
        BoatingTest.all.select {|test| test.instructor == self}.map{|test|test.student}
    end

    def passed_students
        BoatingTest.all.select {|test| test.instructor == self}.select {|test| test.status == "passed"}.map{|test|test.student}
    end

    def pass_student(student, test_name)
        match = BoatingTest.all.find {|test| test.student == student && test.test_name = test_name}
        if !match
            BoatingTest.new(student, test_name, "passed", self)
        elsif match
            #BoatingTest.all.find {|test| test.student == student && test.test_name = test_name}.status = "passed"
            match.status = "passed"
        end
    end

    def fail_student(student, test_name)
        match = BoatingTest.all.find {|test| test.student == student && test.test_name = test_name}
        if !match
            BoatingTest.new(student, test_name, "failed", self)
        elsif match
            #BoatingTest.all.find {|test| test.student == student && test.test_name = test_name}.status = "failed"
            match.status = "failed"
        end
    end

end
