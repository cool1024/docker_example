package com.docker.demo.prop;

import java.io.BufferedReader
import java.io.FileReader
import java.lang.reflect.Field
import java.util.*


class RunTimeProp {

    companion object {

        fun <T : Any> getConfigObject(classOfT: Class<T>): T? {
            val classAnnotation = classOfT.getAnnotation(PropFile::class.java)
            return classOfT.newInstance().apply {
                val props = getFileItem(classAnnotation.fileName)
//                this::class.java.declaredFields
                classOfT.declaredFields.forEach { field ->
                    val fieldAnnotation = field.getAnnotation(PropItem::class.java)
                    println(field.annotations.size)
//                    val value = props.getString(fieldAnnotation.keyName)
//                    println(value)
                }
            }
        }

        fun setItemValue(className: String, defaultFileName: String, field: Field) {
//            val annotation = field.
//            println(annotation)
//            var fileName = defaultFileName
//            if (annotation.fileName?.isNotBlank()) {
//                fileName = annotation.fileName
//            }
//            val value = getKeyItem(fileName, annotation.keyName)
//            println(field.type.name)
            // field.set(instances[className], value)
        }

//        fun getKeyItem(fileName: String, keyName: String): String? {
//            return getFileItem(fileName)?.getProperty(keyName)
//        }

        fun getFileItem(fileName: String): ResourceBundle {
            return ResourceBundle.getBundle(fileName)
        }
    }
}
