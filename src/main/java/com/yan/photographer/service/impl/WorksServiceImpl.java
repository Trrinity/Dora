package com.yan.photographer.service.impl;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yan.common.service.BaseService;
import com.yan.model.TAttachment;
import com.yan.model.TWorks;
import com.yan.photographer.service.IAttachmentService;
import com.yan.photographer.service.IWorksService;
import com.yan.vo.WorksVO;

import tk.mybatis.mapper.entity.Example;

/**
 * 
 * @author yan 2018年3月18日
 *
 */
@Service(value = "worksService")
public class WorksServiceImpl extends BaseService<TWorks> implements IWorksService {

	@Autowired
	private IAttachmentService attachmentService;
	@Override
	public List<Map<String, Object>> getWorksByPhotographerId(Integer id) {
		String sql = "SELECT id, title,path FROM t_works WHERE photographerId = "+id+" AND status = 0";
		
		return sqlMapper.selectList(sql);
	}

	@Override
	public WorksVO getWorks(Integer id) {
		String sql = "SELECT b.id,a.title,DATE_FORMAT(a.createTime,'%Y-%d-%m') AS createTime,a.content,b.`name` AS photographer,c.`name` AS spots,b.head AS path FROM t_works a,t_photographer b,t_spots c WHERE a.photographerId = b.id AND a.spotsId = c.id AND a.id="+id;
		Map<String, Object> map = sqlMapper.selectOne(sql);
		WorksVO worksVO = new WorksVO();
		worksVO.setId(Integer.valueOf(map.get("id").toString()));
		worksVO.setContent(map.get("content").toString());
		worksVO.setCreateTime(map.get("createTime").toString());
		worksVO.setPhotographer(map.get("photographer").toString());
		worksVO.setWorksTitle(map.get("title").toString());
		worksVO.setSpots(map.get("spots").toString());
		worksVO.setPath(map.get("path").toString());
		Example example = new Example(TAttachment.class);
		example.createCriteria().andCondition("worksId=",id);
		worksVO.setImgs(attachmentService.selectByExample(example));;
		return worksVO;
	}


	
}
