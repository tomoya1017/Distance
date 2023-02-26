import CoreGraphics
import UIKit


func twodmto3dm(A_x:Double, A_y:Double, B_x:Double, B_y:Double, C_x:Double, C_y:Double, screen_H:Double, screen_W:Double, vertical_angle:Double, horizontal_angle:Double) -> Double {
    let L = screen_H / (2 * tan(vertical_angle/2))
    let A_prime_x = A_x - screen_W/2
    let A_prime_y = A_y - screen_H/2
    let A_prime_z = L
    let B_prime_x = B_x - screen_W/2
    let B_prime_y = B_y - screen_H/2
    let B_prime_z = L
    let C_prime_x = C_x - screen_W/2
    let C_prime_y = C_y - screen_H/2
    let C_prime_z = L
    
//    print(A_prime_x, A_prime_y, A_prime_z, B_prime_x, B_prime_y, B_prime_z, C_prime_x, C_prime_y, C_prime_z)

    let dx_AB = (A_prime_x - B_prime_x)
    let dy_AB = (A_prime_y - B_prime_y)
    let dz_AB = (A_prime_z - B_prime_z)
    let dx_BC = (B_prime_x - C_prime_x)
    let dy_BC = (B_prime_y - C_prime_y)
    let dz_BC = (B_prime_z - C_prime_z)
    let dx_CA = (C_prime_x - A_prime_x)
    let dy_CA = (C_prime_y - A_prime_y)
    let dz_CA = (C_prime_z - A_prime_z)
    
    let distance_AB = (sqrt(dx_AB*dx_AB + dy_AB*dy_AB + dz_AB*dz_AB)/2.35)
    let distance_BC = (sqrt(dx_BC*dx_BC + dy_BC*dy_BC + dz_BC*dz_BC)/2.35)
    let distacne_CA = (sqrt(dx_CA*dx_CA + dy_CA*dy_CA + dz_CA*dz_CA)/2.35)
    
    print(distance_AB)
    print(distance_BC)
    print(distacne_CA)
    
    return distance_AB; distance_BC; distacne_CA
}


//twodmto3dm(A_x: 511.07260986, A_y: 932.70751102, B_x: 2626.59113916, B_y: 526.95258979, C_x:114.55153967, C_y: 3035.51431833, screen_H: 4032, screen_W: 3024, vertical_angle: 63.44001316326884, horizontal_angle: 49.742171005655024)
//
//twodmto3dm(A_x: 966, A_y: 1969, B_x: 1558.4867, B_y:1821.9686, C_x: 1473, C_y: 1284, screen_H: 4032, screen_W: 3024, vertical_angle: 63.44001316326884, horizontal_angle: 49.742171005655024)
//
//twodmto3dm(A_x: 114.55153967, A_y: 3035.51431833, B_x: 2836.37674788, B_y: 3112.97704501, C_x: 2626.59113916, C_y: 526.95258979, screen_H: 4032, screen_W: 3024, vertical_angle: 63.44001316326884, horizontal_angle: 49.742171005655024)
