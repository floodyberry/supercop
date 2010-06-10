/**
 * This file is a part of the freeware CRYMPIX
 * CRYPTOGRAPHIC MULTIPRECISION SOFTWARE Library.
 * This software is initially designed and developed in the
 * Information System Strategy and Security Laboratory (IS3)
 * of Izmir Institute of Technology (IZTECH).
 *
 * CRYMPIX is engineered to provide a portable environment
 * for the implementation of the latest techniques in
 * computational number theory and cryptology.
 * The content can be modified with the sole condition
 * that this header is kept as is.
 * We provide no guarantee for the correctness and
 * completeness of this software.
 *
 * Please report the bugs to:
 *    crympix-bug@is3.iyte.edu.tr
 *
 * Please submit your contributions to:
 *    crympix-devel@is3.iyte.edu.tr
 *
 * Thank you for using this software.
 **/

#include <stdio.h>
#include <stdlib.h>
#include "_core.h"

void crympix_init(uni_t maxlen)
{
#ifdef DEBUG_ON
	printf("WARNING: CRYMPIX is running in DEBUG mode.\n\n");
#endif
	crympix = (CRYMPIX)malloc(sizeof(CRYMPIX_t));
	crympix->maxlen = maxlen;
	crympix->ll_fast = NULL;
	crympix->ll_slow = NULL;
}

void crympix_kill()
{
	LL walker, temp;

	walker = crympix->ll_slow;
	while(walker != NULL){
		temp = walker->next;
		free(walker);
		walker = temp;
	}
	walker = crympix->ll_fast;
	while(walker != NULL){
		temp = walker->next;
		free(walker);
		walker = temp;
	}
	free(crympix);
}

void *kn_init_fast()
{
	LL new;

	new = NULL;
	if(crympix->ll_fast == NULL){
		new = (LL)malloc(
			sizeof(uni_t) * (crympix->maxlen + 1) +
			sizeof(LL_t) +
			4
		);
		new->next = NULL;
	}
	else{
		new = crympix->ll_fast;
		crympix->ll_fast = crympix->ll_fast->next;
	}
	if(new == NULL){
		kn_exit("kn_init_fast", ERR_OUT_OF_MEMORY);
	}
	else{
		new->flag = LL_SET;
	}
	new->type = 0;
	return (LL)new + 1;
}

void kn_free_fast(void *node)
{
	LL temp, base;

	base = (LL)node - 1;
	if(base->type != 0){
		kn_exit("kn_free_fast", ERR_INVALID_MEMORY);
	}
	if(base->flag == LL_SET){
		temp = crympix->ll_fast;
		crympix->ll_fast = base;
		base->next = temp;
		base->flag = LL_UNSET;
	}
}

void kn_kill_fast(void *node)
{
	LL base;

	base = (LL)node - 1;
	if(base->type != 0){
		kn_exit("kn_kill", ERR_INVALID_MEMORY);
	}
	free(node);
}

void kn_flush_fast()
{
	LL walker, temp;

	walker = crympix->ll_fast->next;
	while(walker != NULL){
		temp = walker->next;
		free(walker);
		walker = temp;
	}
	crympix->ll_fast->next = NULL;
}

void *kn_alloc(uni_t size){ /* number of bytes to allocate */
	uni new;

	new = (uni)malloc(size);
	if(new == NULL){
		kn_exit("kn_alloc: cannot allocate memory", 0);
	}
	return ((void *)new);
}

void kn_release(void *node)
{
	free(node);
}

void *kn_init(){
	LL new;

	new = NULL;
	if(crympix->ll_slow == NULL){
		new = (LL)malloc(
			sizeof(uni_t) * (crympix->maxlen + 1) +
			sizeof(LL_t) +
			4
		);
		if(new == NULL){
			kn_exit("kn_init", 0);
		}
		new->next = NULL;
	}
	else{
		new = crympix->ll_slow;
		crympix->ll_slow = crympix->ll_slow->next;
	}
	if(new == NULL){
		kn_exit("kn_init", ERR_OUT_OF_MEMORY);
	}
	else{
		new->flag = LL_SET;
	}
	new->type = 1;
	return (LL)new + 1;
}

void kn_free(void *node)
{
	LL temp, base;

	base = (LL)node - 1;
	if(base->type != 1){
		kn_exit("kn_free", ERR_INVALID_MEMORY);
	}
	if(base->flag == LL_SET){
		temp = crympix->ll_slow;
		crympix->ll_slow = base;
		base->next = temp;
		base->flag = LL_UNSET;
	}
}

void kn_kill(void *node)
{
	LL base;

	base = (LL)node - 1;
	if(base->type != 1){
		kn_exit("kn_kill", ERR_INVALID_MEMORY);
	}
	free(node);
}

void kn_flush()
{
	LL walker, temp;

	walker = crympix->ll_slow->next;
	while(walker != NULL){
		temp = walker->next;
		free(walker);
		walker = temp;
	}

	crympix->ll_slow->next = NULL;
}

