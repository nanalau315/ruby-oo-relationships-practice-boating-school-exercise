class BoatingTest
    attr_accessor :status
    attr_reader :student, :instructor, :test_name
    @@all = []

    def initialize(student,test_name, status, instructor)
        @student = student
        @test_name = test_name
        @status = "pending"
        @instructor = instructor
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_match(student, test_name)
        self.all.select {|test| test.student == student && test.test_name = test_name}
    end
   # BoatingTest.all.select {|test| test.student == student} && BoatingTest.all.select {|test| test.test_name = test_name}
end
