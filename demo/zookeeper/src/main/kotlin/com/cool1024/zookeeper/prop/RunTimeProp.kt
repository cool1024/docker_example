package com.cool1024.zookeeper.prop

import java.util.*

class RunTimeProp {

    companion object {

        val configs = hashMapOf<String, Any?>()

        inline fun <reified T : Any> config(): T {
            if (!configs.containsKey(T::class.java.name)) {
                configs[T::class.java.name] = getConfigObject(T::class.java)
            }
            return configs[T::class.java.name] as T
        }

        fun <T : Any> getConfigObject(classOfT: Class<T>): T? {
            val classAnnotation = classOfT.getAnnotation(PropFile::class.java)
            val args = arrayListOf<Class<*>>()
            val values = arrayListOf<Any>()
            val props = getFileItem(classAnnotation.fileName)
            classOfT.declaredFields.forEach { field ->
                val fieldAnnotation = field.getAnnotation(PropItem::class.java)
                fieldAnnotation?.run {
                    args.add(field.type)
                    values.add(getItemValue(props, fieldAnnotation.keyName, field.type))
                }
            }
            return classOfT.getConstructor(*args.toTypedArray()).newInstance(*values.toTypedArray())
        }

        private fun getItemValue(props: ResourceBundle, key: String, type: Class<*>): Any {
            val value = props.getString(key)
            return when (type) {
                Long::class.java -> value.toLong()
                Int::class.java -> value.toInt()
                Float::class.java -> value.toFloat()
                Double::class.java -> value.toDouble()
                else -> value
            }
        }

        private fun getFileItem(fileName: String): ResourceBundle {
            return ResourceBundle.getBundle(fileName)
        }
    }
}
