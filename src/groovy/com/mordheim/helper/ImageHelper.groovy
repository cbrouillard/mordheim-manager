package com.mordheim.helper

import javax.imageio.ImageIO
import javax.swing.ImageIcon
import java.awt.Graphics2D
import java.awt.Image
import java.awt.image.BufferedImage

class ImageHelper {

    public static final okcontents = ['image/png', 'image/jpeg']

    static resize = { bytes, out, maxW, maxH ->
        Image ai = new ImageIcon(bytes).image
        int width = ai.getWidth(null)
        int height = ai.getHeight(null)
        assert width >= 50 && width <= 5000 && height >= 50 && height <= 5000: 'Picture is either too small or too big!'

        float aspectRatio = width / height
        float requiredAspectRatio = maxW / maxH

        int dstW = 0
        int dstH = 0
        if (requiredAspectRatio < aspectRatio) {
            dstW = maxW
            dstH = Math.round(maxW / aspectRatio)
            dstH = dstH==0?maxH:dstH
        } else {
            dstH = maxH
            dstW = Math.round(maxH * aspectRatio)
            dstW = dstW==0?maxW:dstW
        }

        BufferedImage bi = new BufferedImage(dstW, dstH, BufferedImage.TYPE_INT_RGB)
        Graphics2D g2d = bi.createGraphics()
        g2d.drawImage(ai, 0, 0, dstW, dstH, null, null)

        ImageIO.write(bi, 'JPEG', out)
    }
}
