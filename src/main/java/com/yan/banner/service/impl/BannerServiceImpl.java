package com.yan.banner.service.impl;


import org.springframework.stereotype.Service;

import com.yan.banner.service.IBannerService;
import com.yan.common.service.BaseService;
import com.yan.model.TBanner;

/**
 * 
 * @author yan 2018年3月19日
 *
 */
@Service(value = "bannerService")
public class BannerServiceImpl extends BaseService<TBanner> implements IBannerService {

}
