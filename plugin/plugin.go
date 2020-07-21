package plugin

import (
	"context"
	"time"

	"github.com/drone/drone-go/drone"
	"github.com/drone/drone-go/plugin/config"
	"github.com/sirupsen/logrus"
)

// New returns a new config plugin.
func New(duration time.Duration) config.Plugin {
	return &plugin{
		duration: duration,
	}
}

type plugin struct {
	duration time.Duration
}

func (p *plugin) Find(ctx context.Context, req *config.Request) (*drone.Config, error) {
	logrus.Infof("sleeping for %s ...", p.duration.String())

	time.Sleep(p.duration)

	logrus.Info("... returning")
	return nil, nil
}
