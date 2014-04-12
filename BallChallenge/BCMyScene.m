//
//  BCMyScene.m
//  BallChallenge
//
//  Created by J Hastwell on 3/04/2014.
//  Copyright (c) 2014 J Hastwell. All rights reserved.
//

#import "BCMyScene.h"

@implementation BCMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        
        SKNode *edge = [SKNode node];
        edge.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self addChild:edge];
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        int random = arc4random_uniform(3);
        
        SKSpriteNode *ball;
        
        switch (random) {
            case 0:
                ball = [SKSpriteNode spriteNodeWithImageNamed:@"8Ball"];
                ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
                ball.physicsBody.mass = 0.8;
                ball.physicsBody.restitution = 0.2;
                break;
                
            case 1:
                ball = [SKSpriteNode spriteNodeWithImageNamed:@"BeachBall"];
                ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
                ball.physicsBody.mass = 0.1;
                ball.physicsBody.restitution = 0.8;
                break;
                
            default:
                ball = [SKSpriteNode spriteNodeWithImageNamed:@"SoccerBall"];
                ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
                ball.physicsBody.mass = 0.4;
                ball.physicsBody.restitution = 0.5;
                break;
        }
        
        ball.position = location;
        [self addChild:ball];

    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
