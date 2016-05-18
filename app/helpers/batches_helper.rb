module BatchesHelper

	@@batches_url = "http://localhost:8080/web-module/products/product_id/batches"

	def self.find(product_id, batch_id, j_session_id)
		response = HTTParty.get batches_url(batch_params[:product_id])+"/#{batch_id}", cookies: {"JSESSIONID": j_session_id}
		Product.new (JSON.parse(response.body))
	end

	def self.save(product, batch_params, j_session_id)
		url = batches_url(batch_params[:product_id])
		options = {
			cookies: {"JSESSIONID": j_session_id},
			body: batch_params.to_json,
			headers: { 'Content-Type' => 'application/json'}
		}
		batch = product.batches.build(batch_params)
		asdx
		if batch.valid?
			response = HTTParty.post url, options
			unless response.code==201 
				batch.errors.add(:batch, 'no se pudo guardar. Codigo de respuesta: '+ response.code.to_s)
			end
		end
		batch
	end

	def self.all(product_id, j_session_id)
		response = HTTParty.get batches_url(batch_params[:product_id]), cookies: {"JSESSIONID": j_session_id}
		product_params = JSON.parse(response.body)
		
		product_params.map do |elem|
			Product.new(elem)
		end
		
	end

	def self.destroy(id,j_session_id)
		response = HTTParty.delete batches_url(batch_params[:product_id])+"/#{batch_id}", cookies: {"JSESSIONID": j_session_id}
	end


	private 

	def self.batches_url(product_id) 
		@@batches_url.gsub("product_id", product_id)
	end
end

