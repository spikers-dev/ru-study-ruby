module Exercise
  module Arrays
    class << self
      def find_max(array)
        el_max = nil
        array.each { |el| el_max = el if el_max.nil? || el_max < el }
        el_max
      end

      def replace(array)
        el_max = find_max(array)
        array.map { |el| el.negative? ? el : el_max }
      end

      def search(array, query)
        search_helper(array, query, 0, array.length)
      end

      def search_helper(array, query, min, max)
        mid = get_mid(min, max)
        return mid if array[mid] == query

        return -1 if max <= min || mid.zero?

        array[mid] < query ? search_helper(array, query, mid, max) : search_helper(array, query, min, mid - 1)
      end

      def get_mid(min, max)
        return 0 if max == 1

        ((max - min) / 2.0).ceil + min
      end
    end
  end
end
