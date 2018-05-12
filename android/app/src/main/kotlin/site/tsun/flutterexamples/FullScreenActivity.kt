package site.tsun.flutterexamples

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import kotlinx.android.synthetic.main.activity_full_screen.*

class FullScreenActivity(): AppCompatActivity(), View.OnClickListener {

    private var count = 0
    private var placeHolder = "";

    companion object {
        val EXTRA_COUNTER = "counter"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_full_screen)

        count = intent.getIntExtra(EXTRA_COUNTER, 0)
        updateCounter()
        btnCounter.setOnClickListener(this)
        btnExit.setOnClickListener(this)
    }

    private fun updateCounter() {
        placeHolder = "You've clicked $count times";
        tvCounter.text = placeHolder
    }

    override fun onClick(v: View?) {
       when (v?.id) {
           btnCounter.id -> handleCounterClick()
           btnExit.id -> returnToFlutterView()
       }
    }

    private fun handleCounterClick() {
        count++
        updateCounter()
    }

    private fun returnToFlutterView() {
        val intent = Intent()
        intent.putExtra(EXTRA_COUNTER, count)
        setResult(Activity.RESULT_OK, intent);
        finish()
    }

    override fun onBackPressed() {
        returnToFlutterView()
    }
}
