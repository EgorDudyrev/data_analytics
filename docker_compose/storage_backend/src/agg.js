/*
        Написать запрос, который выводит общее число тегов
*/
print("tags count: ", db.tags.count());
/*
        Добавляем фильтрацию: считаем только количество тегов woman
*/
print("woman tags count: ",  db.tags.find({name:'woman'}).count());
/*
        Очень сложный запрос: используем группировку данных посчитать количество вхождений для каждого тега
        и напечатать top-3 самых популярных
*/

db.tags.aggregate([{$group: {_id: "$name", tag_count:{$sum:1}}},{$sort:{tag_count:-1}},{$limit:3}])
{ "_id" : "woman director", "tag_count" : 3115 }
{ "_id" : "independent film", "tag_count" : 1930 }
{ "_id" : "murder", "tag_count" : 1308 }


printjson(
        db.tags.aggregate([
                {"$group": {
                                "_id": "$name",
                                "tag_count": {"$sum":1}
                           }
                },
                {"$sort":{"tag_count":-1}},
                {$limit: 3}
        ])['_batch']
);
