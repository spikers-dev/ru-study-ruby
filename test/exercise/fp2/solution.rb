module Exercise
  module Fp2
    class MyArray < Array
      def my_each(&func)
        return self if size.zero?

        yield first
        self.class.new(self[1..]).my_each(&func)
        self
      end

      def my_map
        my_reduce(self.class.new) { |acc, el| acc << yield(el) }
      end

      def my_compact
        my_reduce(self.class.new) { |acc, el| el.nil? ? acc : acc << el }
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
