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

      def my_reduce(acc = nil, &func)
        return acc if size.zero?

        acc = acc.nil? ? first : yield(acc, first)
        self.class.new(self[1..]).my_reduce(acc, &func)
      end
    end
  end
end
