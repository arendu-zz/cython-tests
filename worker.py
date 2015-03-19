class HardWorker(object):

    def __init__(self, task):
        self.task = task
        self.ans = {}

    def work_hard(self, repeat=100):
        for i in range(repeat):
            val = self.task(i)
            self.ans[i] = val

    def get_ans(self):
        return self.ans

