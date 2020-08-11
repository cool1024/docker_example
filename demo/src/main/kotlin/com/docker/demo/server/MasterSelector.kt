package com.docker.demo.server

class MasterSelector {

    private val candidates = arrayListOf<Candidate>()

    fun addCandidate(candidate: Candidate) {
        candidates.add(candidate)
    }

    fun start() {
        candidates.forEach { candidate -> candidate.joinElection() }
    }

    fun printResult() {
        val master = candidates.find { candidate -> candidate.isMaster() }
        val followers = candidates.filter { it.isFollower() }.map { it.getId() }
        print(
            """
            MasterId: ${master?.getId()}
            Follows: ${followers.joinToString { it }}
            """.trimIndent()
        )
    }
}