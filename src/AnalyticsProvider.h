#ifndef ANALYTICSPROVIDER_H
#define ANALYTICSPROVIDER_H

#include <atomic>
#include <memory>
#include <thread>

// TODO implement an object that stores a cv::Mat and motion metadata
// class Frame;
//
// TODO implement a queue class that stores Frame type above
// typedef ?? FrameQueue;

class AnalyticsProvider
{
public:
    AnalyticsProvider(FrameQueue& completedFrameQueue);
    virtual ~AnalyticsProvider();

    void setNextProvider(std::shared_ptr<AnalyticsProvider> provider);

    virtual void insertFrame(std::shared_ptr<Frame>& frame);
    virtual void processThread() = 0;

protected:
    std::atomic<bool> m_running{true};

    std::thread m_processThread;

    FrameQueue m_frameQueue;
    FrameQueue m_completedFrameQueue;

    // may not need another provider, but how would it be used if one exists?
    std::shared_ptr<AnalyticsProvider> m_nextProvider;

    void completeFrame(bool found, std::shared_ptr<Frame> frame);
};
#endif // ANALYTICS_PROVIDER_H
