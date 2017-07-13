SELECT distinct Autoservice.service_name, (SELECT Brand.brand_title FROM Brand WHERE brand.brand_id = Work.brand_id) as brand_title
	FROM WorkCategory JOIN Autoservice ON WorkCategory.category_id = Autoservice.service_id 
		JOIN Work ON Work.work_category = WorkCategory.category_id
			WHERE Work.brand_id IN (SELECT Brand.brand_id FROM Brand WHERE Brand.brand_title LIKE 'Audi')
				
exec GetSTOByBrand 'Audi';

SELECT distinct 
	Autoservice.service_name, 
	(SELECT Brand.brand_title FROM Brand WHERE brand.brand_id = Work.brand_id) as brand_title,
	(SELECT Model.model_title FROM model WHERE model.model_id = Work.model_id) as model_title
	FROM WorkCategory JOIN Autoservice ON WorkCategory.category_id = Autoservice.service_id 
		JOIN Work ON Work.work_category = WorkCategory.category_id
			WHERE 
				Work.brand_id IN (SELECT Brand.brand_id FROM Brand WHERE Brand.brand_title LIKE 'Audi')
				AND
				Work.model_id IN (SELECT Model.model_id FROM Model WHERE Model.model_title LIKE 'A6')

exec GetSTOByBrandAndModel 'Audi', 'A6';

