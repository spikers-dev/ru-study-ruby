module Exercise
  module Fp
    class << self
      def rating(films)
        films_rating = films.map do |film|
          film['rating_kinopoisk'].to_f if film_correct?(film)
        end.compact
        films_rating.reduce(:+) / films_rating.length
      end

      def film_correct?(film)
        film['country'] && \
          !film['rating_kinopoisk'].to_f.zero? && \
          film['country'].split(',').length >= 2
      end

      def chars_count(films, threshold)
        films.map do |film|
          film['name'].count('и') if film['rating_kinopoisk'].to_f >= threshold
        end.compact.reduce(:+)
      end
    end
  end
end
