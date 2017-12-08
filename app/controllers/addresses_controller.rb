class AddressesController < ApplicationController
  def suggestion
    url = 'http://api.map.baidu.com/place/v2/suggestion'
    resp = RestClient.get url, {params: {region: '全国', output: 'json', ak: '9c0105d4f31da574429c49cca95c5566', query: params[:term]}}

    result = JSON.parse(resp)['result'].map do |result|
      {id: result['name'], text: result['name'], lat: result['location']['lat'], lng: result['location']['lng']}
    end
    
    render json: {results: result}
  end
end
