package com.docker.demo

import com.docker.demo.server.Candidate
import com.docker.demo.server.MasterSelector

object App {

    @JvmStatic
    fun main(args: Array<String>) {
        MasterSelector().apply {
            addCandidate(Candidate())
            addCandidate(Candidate())
            addCandidate(Candidate())
            addCandidate(Candidate())
            addCandidate(Candidate())
            start()
        }
    }
}