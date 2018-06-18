package com.yan.comment.service.impl;


import org.springframework.stereotype.Service;

import com.yan.comment.service.ICommentService;
import com.yan.common.service.BaseService;
import com.yan.model.TComment;

/**
 * 
 * @author yan 2018年3月28日
 *
 */
@Service(value = "commentService")
public class CommentServiceImpl extends BaseService<TComment> implements ICommentService {


}
