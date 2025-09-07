// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(uint id, string content, bool completed);
    event TaskCompleted(uint id, bool completed);


    // ---------------- IMAGE STORAGE -=============================================================
    string public imageHash;

    event ImageUploaded(string hash);

    constructor() {
        createTask("First Task"); // Default==============================================================
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }


     // img store kr rha hu ===================================================
    function setImage(string memory _hash) public {
        imageHash = _hash;
        emit ImageUploaded(_hash);
    }

    function getImage() public view returns (string memory) {
        return imageHash;
    }
}
