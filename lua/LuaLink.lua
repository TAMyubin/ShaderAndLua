local LinkedList = {}
local this = LinkedList

--创建列表
function this.new( ... )
	-- body
	local node = {
		pnext = nil,
		prev = nil,
		value = 0,
	}
	node.pnext = node
	node.prev = node
	return node
end

--加入元素
function this.insert( list,val )
	-- body
	local node = {
		pnext = list.pnext,
		prev = list,
		value = val
	}
	list.pnext.prev = node
	list.pnext = node
end
--通过值查找节点
function FindByValue( list,val )
	-- body
	local node = list.pnext
	while not (node ==list) do
		if node.value ==val then
			return node
	end
	node = node.pnext
end
return nil
end
--从链表中删除元素
function this.Delete( list,val )
	-- 1.找到包含元素的节点
	local node = this.FindByValue(list,val)
	if node then
		node.pnext.prev = node.prev
		node.prev.pnext = node.pnext
		node = nil
	else
		print("要删除的元素不存在")
	end
end
--输出列表
function this.dump ( list )
	-- body
	local node = list.pnext
	print("执行")
	while not(node==list) do
		print(node.value)
		node = node.pnext
	end
end
--翻转列表
function this.reverse(list)
	-- body
	local t = list.pnext
	local curnode = list
	repeat
		curnode.pnext = curnode.prev
		curnode.prev = t
		curnode = t
		t = t.pnext
	until curnode ==list
end
b = LinkedList.new()
LinkedList.insert(b,11)
LinkedList.insert(b,12)
LinkedList.insert(b,13)
LinkedList.insert(b,14)
LinkedList.insert(b,15)
LinkedList.insert(b,16)
LinkedList.reverse(b)
LinkedList.dump(b)