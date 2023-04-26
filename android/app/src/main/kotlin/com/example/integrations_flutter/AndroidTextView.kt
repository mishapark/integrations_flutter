package com.example.integrations_flutter

import android.annotation.SuppressLint
import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

@SuppressLint("ResourceType")
internal class AndroidTextView(context: Context, id: Int, creationParams: Map<String?, Any?>?, messenger: BinaryMessenger) : PlatformView {
    private val textView: TextView = TextView(context)

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        var text = if (creationParams == null) {
            "Default text"
        } else {
            creationParams["name"] as String
        }
        textView.id = 123
        textView.textSize = 18f
        textView.text = text
    }
}