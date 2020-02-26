import scrapy


class QuotesSpider(scrapy.Spider):
    name = "tripadvisor_a"
    # This variable stores the URLS to search in
    start_urls = [
        'https://www.tripadvisor.com/Restaurants-g294074-Bogota.html',
    ]

    def parse(self, response):
        # This loop goes through the list of restaurants labeled using classes
        for restaurant in response.css("a._15_ydu6b"):
            yield {
                'name': restaurant.get(),
                'url': restaurant.attrib['href']
            }