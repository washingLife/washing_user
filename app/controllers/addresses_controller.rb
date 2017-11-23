class AddressesController < ApplicationController
  def suggestion
    url = 'http://api.map.baidu.com/place/v2/suggestion'
    resp = RestClient.get url, {params: {region: '全国', output: 'json', ak: 'myjP2b24eOcchHVCQo8nz98Du3vog5Wt', query: params[:term]}}

    result = JSON.parse(resp)['result'].map do |result|
      {id: result['name'], text: result['name'], lat: result['location']['lat'], lng: result['location']['lng']}
    end
    
    render json: {results: result}
  end
end
