module Exercise
  module Arrays
    class << self
      def find_max(array)
        el_max = array.first
        array[1..].each { |el| el_max = el if el > el_max }
        el_max
      end

      def replace(array)
        el_max = find_max(array)
        array.map { |el| el.negative? ? el : el_max }
      end

      def search(array, query, first = 0, last = array.length)
        return -1 if query < first && query > last

        mid = get_mid(first, last)
        return mid if array[mid] == query

        return -1 if last <= first

        array[mid] < query ? search(array, query, mid + 1, last) : search(array, query, first, mid)
      end

      def get_mid(first, last)
        return 0 if last == 1

        first + ((last - first) / 2)
      end
    end
  end
end
