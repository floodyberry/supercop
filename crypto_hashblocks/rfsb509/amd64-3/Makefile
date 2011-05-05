blocks.s: blocks.q
	qhasm-amd64 < blocks.q > blocks.s

blocks.q: genblocks.py
	python genblocks.py \
	> blocks.q
