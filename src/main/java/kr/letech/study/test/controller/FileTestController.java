package kr.letech.study.test.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.letech.study.test.vo.TestFileVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FileTestController {
	@Value("${upload.root.path}")
	private String uploadRootPath;

	private SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");

	@PostMapping("/test/upload.do")
	public String upload(TestFileVO testFileVO, Model model) throws IOException {

		OutputStream out = null;
		MultipartFile[] files = testFileVO.getFiles();

		for (MultipartFile file : files) {

			try {
				InputStream in = file.getInputStream();

				String saveDir = this.uploadRootPath + this.sdf.format(new Date());
				File saveFile = new File(saveDir);
				if (!saveFile.exists()) {
					saveFile.mkdirs();
				}

				String convFileNm = UUID.randomUUID().toString();

				String filePath = saveDir + convFileNm;

				out = new FileOutputStream(filePath);

				IOUtils.copy(in, out);

				Map<String, Object> result = new HashMap<String, Object>();
				result.put("userName", testFileVO.getUserName());
				result.put("convFileNm", convFileNm);
				result.put("orgnFileNm", file.getOriginalFilename());
				result.put("fileSize", file.getSize());

				log.debug(result.toString());

				model.addAttribute("result", result);
			} catch (FileNotFoundException e) {
				throw e;
			} catch (IOException e) {
				throw e;
			} finally {
				IOUtils.closeQuietly(out);
			}
		}

		return "test/upload.tiles";
	}

	@GetMapping("/test/uploadForm.do")
	public String uploadForm() {

		return "test/uploadForm.tiles";
	}
}
