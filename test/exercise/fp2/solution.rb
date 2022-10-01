module Exercise
  module Fp2
    class MyArray < Array
      def my_each
        for el in self
          yield el
        end
      end

      def my_map
        result = MyArray.new
        my_each do |el|
          result << yield(el)
        end
        result
      end

      def my_compact
        MyArray.new(self - [nil])
      end

      def my_reduce(acc = nil)
        my_each do |el|
          acc = acc.nil? ? el : yield(acc, el)
        end
        acc
      end
    end
  end
end
