#include <monotouch/monotouch.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#include <UIKit/UIKit.h>
#include <Foundation/Foundation.h>


static MonoMethod *method_1 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIControlEventProxy_Activated (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_1)
		method_1 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_1)));
		}
	mono_runtime_invoke (method_1, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_2 = NULL;
void *
native_to_managed_trampoline_MonoTouch_Foundation_NSObject_NSObject_Disposer__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_2)
		method_2 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_2));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_2, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_3 = NULL;
void *
native_to_managed_trampoline_MonoTouch_Foundation_NSObject_NSObject_Disposer_Drain (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_3)
		method_3 = get_method_for_selector ([this class], sel).method->method;
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_3, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_3, NULL, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_4 = NULL;
void *
native_to_managed_trampoline_MonoTouch_Foundation_NSActionDispatcher_Apply (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_4)
		method_4 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_4)));
		}
	mono_runtime_invoke (method_4, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_5 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIBarButtonItem_Callback__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_5)
		method_5 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_5));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_5, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_6 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIBarButtonItem_Callback_Call (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_6)
		method_6 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_6)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_6, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_6, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_7 = NULL;
void *
native_to_managed_trampoline_MonoTouch_Foundation_NSAsyncActionDispatcher_Apply (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_7)
		method_7 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_7)));
		}
	mono_runtime_invoke (method_7, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_8 = NULL;
void *
native_to_managed_trampoline_MiniZip_ZipArchive_ZipArchive__ZipArchiveDelegate__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_8)
		method_8 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_8));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_8, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_9 = NULL;
void *
native_to_managed_trampoline_MiniZip_ZipArchive_ZipArchive__ZipArchiveDelegate_ErrorMessage (id this, SEL sel, NSString * p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_9)
		method_9 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_9)));
		}
	arg_ptrs [0] = p0 ? mono_string_new (mono_domain_get (), [p0 UTF8String]) : NULL;
	mono_runtime_invoke (method_9, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_10 = NULL;
void *
native_to_managed_trampoline_MiniZip_ZipArchive_ZipArchive__ZipArchiveDelegate_OverWriteOperation (id this, SEL sel, NSString * p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_10)
		method_10 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_10)));
		}
	arg_ptrs [0] = p0 ? mono_string_new (mono_domain_get (), [p0 UTF8String]) : NULL;
	void* retval = (void *) mono_runtime_invoke (method_10, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_11 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITableViewSource__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_11)
		method_11 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_11));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_11, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_12 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_Clicked (id this, SEL sel, id p0, int p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_12)
		method_12 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_12)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_12, 0));
		}
		arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	mono_runtime_invoke (method_12, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_13 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_Canceled (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_13)
		method_13 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_13)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_13, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_13, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_14 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_WillPresent (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_14)
		method_14 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_14)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_14, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_14, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_15 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_Presented (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_15)
		method_15 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_15)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_15, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_15, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_16 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_WillDismiss (id this, SEL sel, id p0, int p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_16)
		method_16 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_16)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_16, 0));
		}
		arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	mono_runtime_invoke (method_16, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_17 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_Dismissed (id this, SEL sel, id p0, int p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_17)
		method_17 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_17)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_17, 0));
		}
		arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	mono_runtime_invoke (method_17, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_18 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_18)
		method_18 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_18));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_18, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_19 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldBeginEditing (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_19)
		method_19 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_19)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_19, 0));
		}
		arg_ptrs [0] = mobj0;
	void* retval = (void *) mono_runtime_invoke (method_19, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_20 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_EditingStarted (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_20)
		method_20 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_20)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_20, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_20, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_21 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldEndEditing (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_21)
		method_21 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_21)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_21, 0));
		}
		arg_ptrs [0] = mobj0;
	void* retval = (void *) mono_runtime_invoke (method_21, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_22 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_EditingEnded (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_22)
		method_22 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_22)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_22, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_22, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_23 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldClear (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_23)
		method_23 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_23)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_23, 0));
		}
		arg_ptrs [0] = mobj0;
	void* retval = (void *) mono_runtime_invoke (method_23, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_24 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldReturn (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_24)
		method_24 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_24)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_24, 0));
		}
		arg_ptrs [0] = mobj0;
	void* retval = (void *) mono_runtime_invoke (method_24, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_25 = NULL;
void *
native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldChangeCharacters (id this, SEL sel, id p0, NSRange p1, NSString * p2)
{
	void *arg_ptrs [3];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_25)
		method_25 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_25)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_25, 0));
		}
		arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = p2 ? mono_string_new (mono_domain_get (), [p2 UTF8String]) : NULL;
	void* retval = (void *) mono_runtime_invoke (method_25, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_26 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_AppDelegate__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_26)
		method_26 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_26));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_26, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_27 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_AppDelegate_FinishedLaunching (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_27)
		method_27 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_27)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_27, 0));
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_nsobject_with_type_for_ptr (nsobj1, false, monotouch_get_parameter_type (method_27, 1));
		}
		arg_ptrs [1] = mobj1;
	void* retval = (void *) mono_runtime_invoke (method_27, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_28 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_TableSource_RowsInSection (id this, SEL sel, id p0, int p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_28)
		method_28 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_28)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_28, 0));
		}
		arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	void* retval = (void *) mono_runtime_invoke (method_28, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_29 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_TableSource_GetCell (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_29)
		method_29 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_29)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_29, 0));
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_nsobject_with_type_for_ptr (nsobj1, false, monotouch_get_parameter_type (method_29, 1));
		}
		arg_ptrs [1] = mobj1;
	void* retval = (void *) mono_runtime_invoke (method_29, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_30 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_TableSource_RowSelected (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_30)
		method_30 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_30)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_30, 0));
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_nsobject_with_type_for_ptr (nsobj1, false, monotouch_get_parameter_type (method_30, 1));
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_30, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_31 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_TableSource_RowsInSection (id this, SEL sel, id p0, int p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_31)
		method_31 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_31)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_31, 0));
		}
		arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	void* retval = (void *) mono_runtime_invoke (method_31, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_32 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_TableSource_RowSelected (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_32)
		method_32 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_32)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_32, 0));
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_nsobject_with_type_for_ptr (nsobj1, false, monotouch_get_parameter_type (method_32, 1));
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_32, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_33 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_TableSource_GetCell (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_33)
		method_33 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_33)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_33, 0));
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_nsobject_with_type_for_ptr (nsobj1, false, monotouch_get_parameter_type (method_33, 1));
		}
		arg_ptrs [1] = mobj1;
	void* retval = (void *) mono_runtime_invoke (method_33, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_34 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_BookScreen_get_webViewBookScreen (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_34)
		method_34 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_34)));
		}
	void* retval = (void *) mono_runtime_invoke (method_34, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_35 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_BookScreen_set_webViewBookScreen (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_35)
		method_35 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_35)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_35, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_35, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_36 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_BookScreen__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_36)
		method_36 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_36));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_36, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_37 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_BookScreen_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_37)
		method_37 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_37)));
		}
	mono_runtime_invoke (method_37, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_38 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_BookScreen_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_38)
		method_38 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_38)));
		}
	mono_runtime_invoke (method_38, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_39 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen_get_tableSearchResults (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_39)
		method_39 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_39)));
		}
	void* retval = (void *) mono_runtime_invoke (method_39, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_40 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen_set_tableSearchResults (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_40)
		method_40 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_40)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_40, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_40, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_41 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_41)
		method_41 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_41));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_41, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_42 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_42)
		method_42 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_42)));
		}
	mono_runtime_invoke (method_42, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_43 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_43)
		method_43 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_43)));
		}
	mono_runtime_invoke (method_43, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_44 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnAimeLogo (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_44)
		method_44 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_44)));
		}
	void* retval = (void *) mono_runtime_invoke (method_44, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_45 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnAimeLogo (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_45)
		method_45 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_45)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_45, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_45, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_46 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnCamtBook (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_46)
		method_46 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_46)));
		}
	void* retval = (void *) mono_runtime_invoke (method_46, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_47 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnCamtBook (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_47)
		method_47 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_47)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_47, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_47, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_48 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnLms (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_48)
		method_48 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_48)));
		}
	void* retval = (void *) mono_runtime_invoke (method_48, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_49 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnLms (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_49)
		method_49 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_49)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_49, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_49, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_50 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnLowes (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_50)
		method_50 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_50)));
		}
	void* retval = (void *) mono_runtime_invoke (method_50, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_51 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnLowes (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_51)
		method_51 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_51)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_51, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_51, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_52 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnNaaLogo (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_52)
		method_52 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_52)));
		}
	void* retval = (void *) mono_runtime_invoke (method_52, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_53 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnNaaLogo (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_53)
		method_53 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_53)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_53, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_53, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_54 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnTerminologyGuide (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_54)
		method_54 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_54)));
		}
	void* retval = (void *) mono_runtime_invoke (method_54, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_55 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnTerminologyGuide (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_55)
		method_55 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_55)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_55, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_55, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_56 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnVideos (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_56)
		method_56 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_56)));
		}
	void* retval = (void *) mono_runtime_invoke (method_56, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_57 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnVideos (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_57)
		method_57 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_57)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_57, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_57, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_58 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_get_searchTextInput (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_58)
		method_58 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_58)));
		}
	void* retval = (void *) mono_runtime_invoke (method_58, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_59 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_set_searchTextInput (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_59)
		method_59 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_59)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_59, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_59, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_60 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_60)
		method_60 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_60));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_60, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_61 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_61)
		method_61 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_61)));
		}
	mono_runtime_invoke (method_61, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_62 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_GetSupportedInterfaceOrientations (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_62)
		method_62 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_62)));
		}
	void* retval = (void *) mono_runtime_invoke (method_62, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_63 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_63)
		method_63 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_63)));
		}
	mono_runtime_invoke (method_63, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_64 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_MainScreen_ShouldAutorotateToInterfaceOrientation (id this, SEL sel, int p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_64)
		method_64 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_64)));
		}
	arg_ptrs [0] = &p0;
	void* retval = (void *) mono_runtime_invoke (method_64, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_65 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnCloggedWaterPump (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_65)
		method_65 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_65)));
		}
	void* retval = (void *) mono_runtime_invoke (method_65, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_66 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnCloggedWaterPump (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_66)
		method_66 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_66)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_66, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_66, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_67 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnDishWasherAndCornerSeal (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_67)
		method_67 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_67)));
		}
	void* retval = (void *) mono_runtime_invoke (method_67, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_68 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnDishWasherAndCornerSeal (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_68)
		method_68 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_68)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_68, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_68, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_69 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnDryAirFlowTrouble (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_69)
		method_69 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_69)));
		}
	void* retval = (void *) mono_runtime_invoke (method_69, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_70 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnDryAirFlowTrouble (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_70)
		method_70 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_70)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_70, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_70, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_71 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnRefrigTherm (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_71)
		method_71 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_71)));
		}
	void* retval = (void *) mono_runtime_invoke (method_71, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_72 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnRefrigTherm (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_72)
		method_72 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_72)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_72, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_72, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_73 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnResetOvenTemp (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_73)
		method_73 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_73)));
		}
	void* retval = (void *) mono_runtime_invoke (method_73, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_74 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnResetOvenTemp (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_74)
		method_74 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_74)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_74, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_74, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_75 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_dynamicVideoTable (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_75)
		method_75 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_75)));
		}
	void* retval = (void *) mono_runtime_invoke (method_75, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_76 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_dynamicVideoTable (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_76)
		method_76 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_76)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_76, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_76, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_77 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_77)
		method_77 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_77));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_77, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_78 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_78)
		method_78 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_78)));
		}
	mono_runtime_invoke (method_78, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_79 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_VideoListScreen_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_79)
		method_79 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_79)));
		}
	mono_runtime_invoke (method_79, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_80 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_WebPortalScreen_get_webViewPortal (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_80)
		method_80 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_80)));
		}
	void* retval = (void *) mono_runtime_invoke (method_80, mthis, arg_ptrs, NULL);
	void * res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		mono_field_get_value (retval, monotouch_nsobject_handle_field, (void **) &retobj);
		[retobj retain];
		[retobj autorelease];
		res = retobj;
	}
	return res;
}

static MonoMethod *method_81 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_WebPortalScreen_set_webViewPortal (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_81)
		method_81 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_81)));
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_nsobject_with_type_for_ptr (nsobj0, false, monotouch_get_parameter_type (method_81, 0));
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_81, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_82 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_WebPortalScreen__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_82)
		method_82 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_82));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_82, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_83 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_WebPortalScreen_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_83)
		method_83 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_83)));
		}
	mono_runtime_invoke (method_83, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_84 = NULL;
void *
native_to_managed_trampoline_CAMT_IOS_WebPortalScreen_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_84)
		method_84 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_nsobject_with_type_for_ptr (this, false, mono_class_get_type (mono_method_get_class (method_84)));
		}
	mono_runtime_invoke (method_84, mthis, arg_ptrs, NULL);
	return NULL;
}



static MTClassMap __monotouch_class_map [] = {
	{"NSObject", "MonoTouch.Foundation.NSObject, monotouch", 0},
	{"ZipArchive", "MiniZip.ZipArchive.ZipArchive, ZipArchive", 0},
	{"NSRunLoop", "MonoTouch.Foundation.NSRunLoop, monotouch", 0},
	{"UIDevice", "MonoTouch.UIKit.UIDevice, monotouch", 0},
	{"NSString", "MonoTouch.Foundation.NSString, monotouch", 0},
	{"MonoTouch.UIKit.UIControlEventProxy", "MonoTouch.UIKit.UIControlEventProxy, monotouch", 0},
	{"UIColor", "MonoTouch.UIKit.UIColor, monotouch", 0},
	{"NSURL", "MonoTouch.Foundation.NSUrl, monotouch", 0},
	{"UIResponder", "MonoTouch.UIKit.UIResponder, monotouch", 0},
	{"NSArray", "MonoTouch.Foundation.NSArray, monotouch", 0},
	{"NSBundle", "MonoTouch.Foundation.NSBundle, monotouch", 0},
	{"NSCoder", "MonoTouch.Foundation.NSCoder, monotouch", 0},
	{"NSDictionary", "MonoTouch.Foundation.NSDictionary, monotouch", 0},
	{"NSIndexPath", "MonoTouch.Foundation.NSIndexPath, monotouch", 0},
	{"NSURLRequest", "MonoTouch.Foundation.NSUrlRequest, monotouch", 0},
	{"UIScreen", "MonoTouch.UIKit.UIScreen, monotouch", 0},
	{"UIBarItem", "MonoTouch.UIKit.UIBarItem, monotouch", 0},
	{"NSException", "MonoTouch.Foundation.NSException, monotouch", 0},
	{"ZipArchiveDelegate", "MiniZip.ZipArchive.ZipArchiveDelegate, ZipArchive", 0},
	{"__NSObject_Disposer", "MonoTouch.Foundation.NSObject+NSObject_Disposer, monotouch", 0},
	{"__MonoMac_NSActionDispatcher", "MonoTouch.Foundation.NSActionDispatcher, monotouch", 0},
	{"MonoTouch.UIKit.UIBarButtonItem+Callback", "MonoTouch.UIKit.UIBarButtonItem+Callback, monotouch", 0},
	{"__MonoMac_NSAsyncActionDispatcher", "MonoTouch.Foundation.NSAsyncActionDispatcher, monotouch", 0},
	{"CALayer", "MonoTouch.CoreAnimation.CALayer, monotouch", 0},
	{"NSAutoreleasePool", "MonoTouch.Foundation.NSAutoreleasePool, monotouch", 0},
	{"MPMoviePlayerController", "MonoTouch.MediaPlayer.MPMoviePlayerController, monotouch", 0},
	{"MiniZip.ZipArchive.ZipArchive+_ZipArchiveDelegate", "MiniZip.ZipArchive.ZipArchive+_ZipArchiveDelegate, ZipArchive", 0},
	{"MonoTouch.UIKit.UIActionSheet+_UIActionSheetDelegate", "MonoTouch.UIKit.UIActionSheet+_UIActionSheetDelegate, monotouch", 0},
	{"UIView", "MonoTouch.UIKit.UIView, monotouch", 0},
	{"UIApplication", "MonoTouch.UIKit.UIApplication, monotouch", 0},
	{"UIBarButtonItem", "MonoTouch.UIKit.UIBarButtonItem, monotouch", 0},
	{"MonoTouch.UIKit.UITextField+_UITextFieldDelegate", "MonoTouch.UIKit.UITextField+_UITextFieldDelegate, monotouch", 0},
	{"UIViewController", "MonoTouch.UIKit.UIViewController, monotouch", 0},
	{"AppDelegate", "CAMT_IOS.AppDelegate, CAMT_IOS", 0},
	{"UILabel", "MonoTouch.UIKit.UILabel, monotouch", 0},
	{"UIScrollView", "MonoTouch.UIKit.UIScrollView, monotouch", 0},
	{"CAMT_IOS.VideoListScreen+TableSource", "CAMT_IOS.VideoListScreen+TableSource, CAMT_IOS", 0},
	{"CAMT_IOS.LoadingOverlay", "CAMT_IOS.LoadingOverlay, CAMT_IOS", 0},
	{"CAMT_IOS.TableSource", "CAMT_IOS.TableSource, CAMT_IOS", 0},
	{"UIWebView", "MonoTouch.UIKit.UIWebView, monotouch", 0},
	{"BookScreen", "CAMT_IOS.BookScreen, CAMT_IOS", 0},
	{"SearchResultsScreen", "CAMT_IOS.SearchResultsScreen, CAMT_IOS", 0},
	{"MainScreen", "CAMT_IOS.MainScreen, CAMT_IOS", 0},
	{"UIActivityIndicatorView", "MonoTouch.UIKit.UIActivityIndicatorView, monotouch", 0},
	{"UITableViewCell", "MonoTouch.UIKit.UITableViewCell, monotouch", 0},
	{"UINavigationController", "MonoTouch.UIKit.UINavigationController, monotouch", 0},
	{"UIControl", "MonoTouch.UIKit.UIControl, monotouch", 0},
	{"UIActionSheet", "MonoTouch.UIKit.UIActionSheet, monotouch", 0},
	{"VideoListScreen", "CAMT_IOS.VideoListScreen, CAMT_IOS", 0},
	{"WebPortalScreen", "CAMT_IOS.WebPortalScreen, CAMT_IOS", 0},
	{"UIWindow", "MonoTouch.UIKit.UIWindow, monotouch", 0},
	{"UIAlertView", "MonoTouch.UIKit.UIAlertView, monotouch", 0},
	{"UIButton", "MonoTouch.UIKit.UIButton, monotouch", 0},
	{"UITableView", "MonoTouch.UIKit.UITableView, monotouch", 0},
	{"UITextField", "MonoTouch.UIKit.UITextField, monotouch", 0},
};

static MTClass __monotouch_classes [] = {
	{"MonoTouch.UIKit.UIControlEventProxy", "NSObject", 1, 1, 0},
	{"__NSObject_Disposer", "NSObject", 1, 2, 0},
	{"__MonoMac_NSActionDispatcher", "NSObject", 1, 1, 0},
	{"MonoTouch.UIKit.UIBarButtonItem+Callback", "NSObject", 1, 2, 0},
	{"__MonoMac_NSAsyncActionDispatcher", "NSObject", 1, 1, 0},
	{"MiniZip.ZipArchive.ZipArchive+_ZipArchiveDelegate", "NSObject", 1, 3, 0},
	{"UITableViewSource", "NSObject", 1, 1, 0},
	{"MonoTouch.UIKit.UIActionSheet+_UIActionSheetDelegate", "NSObject", 1, 6, 0},
	{"MonoTouch.UIKit.UITextField+_UITextFieldDelegate", "NSObject", 1, 8, 0},
	{"AppDelegate", "NSObject", 1, 2, 0},
	{"CAMT_IOS.VideoListScreen+TableSource", "NSObject", 1, 3, 0},
	{"CAMT_IOS.LoadingOverlay", "UIView", 1, 0, 0},
	{"CAMT_IOS.TableSource", "NSObject", 1, 3, 0},
	{"BookScreen", "UIViewController", 1, 5, 0},
	{"SearchResultsScreen", "UIViewController", 1, 5, 0},
	{"MainScreen", "UIViewController", 1, 21, 0},
	{"VideoListScreen", "UIViewController", 1, 15, 0},
	{"WebPortalScreen", "UIViewController", 1, 5, 0},
};

static MTIvar __monotouch_ivars [] = {
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
};

static MTMethod __monotouch_methods [] = {
	{"BridgeSelector","v@:",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIControlEventProxy_Activated},
	{"init","@@:",0, &native_to_managed_trampoline_MonoTouch_Foundation_NSObject_NSObject_Disposer__ctor},
	{"drain:","v@:@",1, &native_to_managed_trampoline_MonoTouch_Foundation_NSObject_NSObject_Disposer_Drain},
	{"xamarinApplySelector","v@:",0, &native_to_managed_trampoline_MonoTouch_Foundation_NSActionDispatcher_Apply},
	{"init","@@:",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIBarButtonItem_Callback__ctor},
	{"InvokeAction:","v@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIBarButtonItem_Callback_Call},
	{"xamarinApplySelector","v@:",0, &native_to_managed_trampoline_MonoTouch_Foundation_NSAsyncActionDispatcher_Apply},
	{"init","@@:",0, &native_to_managed_trampoline_MiniZip_ZipArchive_ZipArchive__ZipArchiveDelegate__ctor},
	{"ErrorMessage:","v@:@",0, &native_to_managed_trampoline_MiniZip_ZipArchive_ZipArchive__ZipArchiveDelegate_ErrorMessage},
	{"OverWriteOperation:","B@:@",0, &native_to_managed_trampoline_MiniZip_ZipArchive_ZipArchive__ZipArchiveDelegate_OverWriteOperation},
	{"init","@@:",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITableViewSource__ctor},
	{"actionSheet:clickedButtonAtIndex:","v@:@i",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_Clicked},
	{"actionSheetCancel:","v@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_Canceled},
	{"willPresentActionSheet:","v@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_WillPresent},
	{"didPresentActionSheet:","v@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_Presented},
	{"actionSheet:willDismissWithButtonIndex:","v@:@i",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_WillDismiss},
	{"actionSheet:didDismissWithButtonIndex:","v@:@i",0, &native_to_managed_trampoline_MonoTouch_UIKit_UIActionSheet__UIActionSheetDelegate_Dismissed},
	{"init","@@:",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate__ctor},
	{"textFieldShouldBeginEditing:","B@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldBeginEditing},
	{"textFieldDidBeginEditing:","v@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_EditingStarted},
	{"textFieldShouldEndEditing:","B@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldEndEditing},
	{"textFieldDidEndEditing:","v@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_EditingEnded},
	{"textFieldShouldClear:","B@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldClear},
	{"textFieldShouldReturn:","B@:@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldReturn},
	{"textField:shouldChangeCharactersInRange:replacementString:","B@:@{NSRange=ii}@",0, &native_to_managed_trampoline_MonoTouch_UIKit_UITextField__UITextFieldDelegate_ShouldChangeCharacters},
	{"init","@@:",0, &native_to_managed_trampoline_CAMT_IOS_AppDelegate__ctor},
	{"application:didFinishLaunchingWithOptions:","B@:@@",0, &native_to_managed_trampoline_CAMT_IOS_AppDelegate_FinishedLaunching},
	{"tableView:numberOfRowsInSection:","i@:@i",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_TableSource_RowsInSection},
	{"tableView:cellForRowAtIndexPath:","@@:@@",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_TableSource_GetCell},
	{"tableView:didSelectRowAtIndexPath:","v@:@@",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_TableSource_RowSelected},
	{"tableView:numberOfRowsInSection:","i@:@i",0, &native_to_managed_trampoline_CAMT_IOS_TableSource_RowsInSection},
	{"tableView:didSelectRowAtIndexPath:","v@:@@",0, &native_to_managed_trampoline_CAMT_IOS_TableSource_RowSelected},
	{"tableView:cellForRowAtIndexPath:","@@:@@",0, &native_to_managed_trampoline_CAMT_IOS_TableSource_GetCell},
	{"webViewBookScreen","@@:",0, &native_to_managed_trampoline_CAMT_IOS_BookScreen_get_webViewBookScreen},
	{"setWebViewBookScreen:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_BookScreen_set_webViewBookScreen},
	{"init","@@:",0, &native_to_managed_trampoline_CAMT_IOS_BookScreen__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_CAMT_IOS_BookScreen_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_CAMT_IOS_BookScreen_ViewDidLoad},
	{"tableSearchResults","@@:",0, &native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen_get_tableSearchResults},
	{"setTableSearchResults:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen_set_tableSearchResults},
	{"init","@@:",0, &native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_CAMT_IOS_SearchResultsScreen_ViewDidLoad},
	{"btnAimeLogo","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnAimeLogo},
	{"setBtnAimeLogo:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnAimeLogo},
	{"btnCamtBook","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnCamtBook},
	{"setBtnCamtBook:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnCamtBook},
	{"btnLms","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnLms},
	{"setBtnLms:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnLms},
	{"btnLowes","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnLowes},
	{"setBtnLowes:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnLowes},
	{"btnNaaLogo","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnNaaLogo},
	{"setBtnNaaLogo:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnNaaLogo},
	{"btnTerminologyGuide","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnTerminologyGuide},
	{"setBtnTerminologyGuide:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnTerminologyGuide},
	{"btnVideos","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_get_btnVideos},
	{"setBtnVideos:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_set_btnVideos},
	{"searchTextInput","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_get_searchTextInput},
	{"setSearchTextInput:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_set_searchTextInput},
	{"init","@@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_DidReceiveMemoryWarning},
	{"supportedInterfaceOrientations","i@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_GetSupportedInterfaceOrientations},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_ViewDidLoad},
	{"shouldAutorotateToInterfaceOrientation:","B@:i",0, &native_to_managed_trampoline_CAMT_IOS_MainScreen_ShouldAutorotateToInterfaceOrientation},
	{"btnCloggedWaterPump","@@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnCloggedWaterPump},
	{"setBtnCloggedWaterPump:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnCloggedWaterPump},
	{"btnDishWasherAndCornerSeal","@@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnDishWasherAndCornerSeal},
	{"setBtnDishWasherAndCornerSeal:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnDishWasherAndCornerSeal},
	{"btnDryAirFlowTrouble","@@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnDryAirFlowTrouble},
	{"setBtnDryAirFlowTrouble:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnDryAirFlowTrouble},
	{"btnRefrigTherm","@@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnRefrigTherm},
	{"setBtnRefrigTherm:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnRefrigTherm},
	{"btnResetOvenTemp","@@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_btnResetOvenTemp},
	{"setBtnResetOvenTemp:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_btnResetOvenTemp},
	{"dynamicVideoTable","@@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_get_dynamicVideoTable},
	{"setDynamicVideoTable:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_set_dynamicVideoTable},
	{"init","@@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_CAMT_IOS_VideoListScreen_ViewDidLoad},
	{"webViewPortal","@@:",0, &native_to_managed_trampoline_CAMT_IOS_WebPortalScreen_get_webViewPortal},
	{"setWebViewPortal:","v@:@",0, &native_to_managed_trampoline_CAMT_IOS_WebPortalScreen_set_webViewPortal},
	{"init","@@:",0, &native_to_managed_trampoline_CAMT_IOS_WebPortalScreen__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_CAMT_IOS_WebPortalScreen_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_CAMT_IOS_WebPortalScreen_ViewDidLoad},
};

static MTProperty __monotouch_properties [] = {
};

int __monotouch_map_count = 55;
static int __monotouch_class_count = 18;

void monotouch_create_classes (void) {
	int i,j;
	int ivar_offset = 0;
	int method_offset = 0;
	int prop_offset = 0;

	for (i = 0; i < __monotouch_class_count; i++) {
		Class handle = objc_allocateClassPair (objc_getClass (__monotouch_classes [i].supername), __monotouch_classes [i].name, 0);
		if (handle == NULL) {
			ivar_offset += __monotouch_classes [i].ivar_count;
			method_offset += __monotouch_classes [i].method_count;
			prop_offset += __monotouch_classes [i].prop_count;
			continue;
		}
		for (j = 0; j < __monotouch_classes [i].ivar_count; j++, ivar_offset++)
			class_addIvar (handle, __monotouch_ivars [ivar_offset].name, __monotouch_ivars [ivar_offset].size, __monotouch_ivars [ivar_offset].align, __monotouch_ivars [ivar_offset].type);
		class_addMethod (handle, sel_registerName ("release"), (IMP) &monotouch_release_trampoline, "v@:");
		class_addMethod (handle, sel_registerName ("retain"), (IMP) &monotouch_retain_trampoline, "@@:");
		class_addMethod (handle, sel_registerName ("conformsToProtocol:"), (IMP) &monotouch_trampoline, "B@:^v");
		for (j = 0; j < __monotouch_classes [i].method_count; j++, method_offset++) {
			Class h = (__monotouch_methods [method_offset].isstatic ? handle->isa : handle);
			class_addMethod (h, sel_registerName (__monotouch_methods [method_offset].selector), __monotouch_methods [method_offset].trampoline, __monotouch_methods [method_offset].signature);
		}
		for (j = 0; j < __monotouch_classes [i].prop_count; j++, prop_offset++) {
			int count = 0;
			objc_property_attribute_t props[3];
			props [count].name = "T";
			props [count++].value = __monotouch_properties [prop_offset].type;
			if (*__monotouch_properties [prop_offset].argument_semantic != 0) {
				props [count].name = __monotouch_properties [prop_offset].argument_semantic;
				props [count++].value = "";
			}
			props [count].name = "V";
			props [count++].value = __monotouch_properties [prop_offset].name;
			class_addProperty (handle, __monotouch_properties [prop_offset].name, props, count);;
		}
		objc_registerClassPair (handle);
	}
	for (i = 0; i < __monotouch_map_count; i++) {
		__monotouch_class_map [i].handle = objc_getClass (__monotouch_class_map [i].name);
	}
	monotouch_setup_classmap (__monotouch_class_map, __monotouch_map_count);
}
