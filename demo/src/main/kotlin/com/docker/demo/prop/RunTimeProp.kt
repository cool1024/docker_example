package com.docker.demo.prop;

import com.docker.demo.ZookeeperConfig
import java.io.BufferedReader
import java.io.FileReader
import java.lang.reflect.Field
import java.lang.reflect.Type
import java.util.*


class RunTimeProp {

    companion object {

        fun <T : Any> getConfigObject(classOfT: Class<T>): T? {
            val classAnnotation = classOfT.getAnnotation(PropFile::class.java)
            val args = arrayListOf<Class<*>>()
            val values = arrayListOf<Any>()
            val props = getFileItem(classAnnotation.fileName)
            classOfT.declaredFields.forEach { field ->
                val fieldAnnotation = field.getAnnotation(PropItem::class.java)
                args.add(field.type)
                values.add(props.getObject(fieldAnnotation.keyName))
            }
            return classOfT.getConstructor(*args.toTypedArray()).newInstance(*values.toTypedArray())
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
