class Student
    attr_reader :name
    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, test_name, status, instructor)
    end

    def all_instructors
        BoatingTest.all.select {|test| test.student == self}.map{|test| test.instructor}
    end

    def grade_percentage
        all_test = BoatingTest.all.select {|test| test.student == self}
        all_test_results = all_test.map{|test| test.status}
        passed = all_test_results.select {|result| result == "passed"}.count
        (passed.to_f / all_test.count.to_f) * 100
    end

    def self.find_student(first_name)
        self.all.find {|stu| stu.first_name == first_name}
    end

end
