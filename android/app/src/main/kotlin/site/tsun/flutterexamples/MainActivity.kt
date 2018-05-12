package site.tsun.flutterexamples

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity(): FlutterActivity() {

    private val CHANNEL = "flutter.tsun.site/platform"
    private val FULL_SCREEN_CODE = 1

    private lateinit var result: MethodChannel.Result

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            this.result = result
            when (call.method) {
                "full_screen" -> {
                    handleFullScreen(call)

                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun handleFullScreen(call: MethodCall) {
        val intent = Intent(this, FullScreenActivity::class.java)
        Log.e("check arguments -->>   ", call.arguments.toString());
        intent.putExtra(FullScreenActivity.EXTRA_COUNTER, call.arguments as Int)
        startActivityForResult(intent, FULL_SCREEN_CODE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        when (requestCode) {
            FULL_SCREEN_CODE -> {
                if (resultCode == RESULT_OK) {
                    this.result.success(data?.getIntExtra(FullScreenActivity.EXTRA_COUNTER, 0))
                } else {
                    this.result.error("ACTIVITY_FAILURE", "Failed while launching activity", null)
                }
            }
        }
    }
}
