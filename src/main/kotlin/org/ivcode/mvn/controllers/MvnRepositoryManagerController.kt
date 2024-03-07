package org.ivcode.mvn.controllers

import org.ivcode.mvn.services.mvnrepo.MvnRepository
import org.ivcode.mvn.services.mvnrepo.MvnRepositoryService
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping(path = ["/api/mvn"])
public class MvnRepositoryManagerController(
    private val mvnRepositoryService: MvnRepositoryService
) {

    @PostMapping
    public fun createRepo(repo: MvnRepository) {
        mvnRepositoryService.createRepository(repo)
    }

    @GetMapping
    public fun getRepos(): List<MvnRepository> = mvnRepositoryService.readRepositories()

    @DeleteMapping(path = ["/{name}"])
    public fun deleteRepo(
        @PathVariable name: String
    ) {
        mvnRepositoryService.deleteRepository(name)
    }

}