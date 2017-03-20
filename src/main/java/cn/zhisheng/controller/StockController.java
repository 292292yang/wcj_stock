package cn.zhisheng.controller;

import cn.zhisheng.model.StockEntity;
import cn.zhisheng.repository.StockRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by 10412 on 2016/12/22.
 */
@Controller
public class StockController
{

    private static final Logger logger=LoggerFactory.getLogger(StockController.class);

    @Autowired
    StockRepository stockRepository;


    //查看所有博文
    @RequestMapping(value = "/admin/stocks", method = RequestMethod.GET)
    public String showStocks(ModelMap modelMap)
    {
        List<StockEntity> stockList = stockRepository.findAll();

        modelMap.addAttribute("stockList", stockList);

        return "/admin/stocks";
    }

    @RequestMapping(value = "/admin/stocks/queryStock", method = RequestMethod.POST)
    public String queryStocks(String partName,ModelMap modelMap)
    {
        List<StockEntity> stockList = stockRepository.queryByPartName(partName);
        modelMap.addAttribute("stockList", stockList);
        return "/admin/stocks";
    }

    //访问添加博客界面
    @RequestMapping(value = "/admin/stocks/add", method = RequestMethod.GET)
    public String addStock(ModelMap modelMap)
    {
        List<StockEntity> userList = stockRepository.findAll();

        //像jsp中注入用户列表
        modelMap.addAttribute("userList", userList);

       return "/admin/addStock";
    }


    //处理添加博客请求，并重定向到博客管理界面
    @RequestMapping(value = "/admin/stocks/addP", method = RequestMethod.POST)
    public String addStockPost(@ModelAttribute("stock") StockEntity stockEntity)
    {
        // 注意此处，post请求传递过来的是一个BlogEntity对象，里面包含了该博客的信息
        // 通过@ModelAttribute()注解可以获取传递过来的'blog'，并创建这个对象

        // 数据库中添加一篇博客，并立即刷新缓存并写入数据库
        stockRepository.saveAndFlush(stockEntity);

        // 重定向到用户管理页面，方法为 redirect:url
        return "redirect:/admin/stocks";
    }


    //查看博客详情
    //@PathVariable可以收集url中的变量，需匹配的变量用{}括起来
    // 例如：访问 localhost:8080/admin/blogs/show/1 ，将匹配 id = 1
    @RequestMapping(value = "/admin/stocks/show/{id}")
    public String showStock(@PathVariable("id") int id, ModelMap modelMap)
    {
        //找到id所对应的博客
        StockEntity stock = stockRepository.findOne(id);

        //传递给请求页面
        modelMap.addAttribute("stock", stock);

        //转到博客详情页面
        return "/admin/stockDetail";
    }



    // 修改博客内容，页面
    @RequestMapping("/admin/stocks/update/{id}")
    public String updateStock(@PathVariable("id") int id, ModelMap modelMap) {

        logger.debug("-----debug------id={}",id);

        StockEntity stock = stockRepository.findOne(id);
        List<StockEntity> stockList = stockRepository.findAll();
        modelMap.addAttribute("stock", stock);
        return "admin/updateStock";
    }

    // 修改博客内容，POST请求
    @RequestMapping(value = "/admin/stocks/updateStock", method = RequestMethod.POST)
    public String updateStock(@ModelAttribute("stock") StockEntity stockEntity) {
        // 更新博客信息
        stockRepository.updateStock(stockEntity.getPartNO(),stockEntity.getPartName(),stockEntity.getModel(),
                stockEntity.getLoc(),stockEntity.getQuantity(),stockEntity.getPrice(),stockEntity.getId());
        stockRepository.flush();
        return "redirect:/admin/stocks";
    }


    // 删除博客文章
    @RequestMapping("/admin/stocks/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        stockRepository.delete(id);
        stockRepository.flush();
        return "redirect:/admin/stocks";
    }

}
