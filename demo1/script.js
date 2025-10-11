const sections = [
  { id: 'section-intro', label: '概览' },
  { id: 'section-objectives', label: '产品目标' },
  { id: 'section-flow', label: '工单流程' },
  { id: 'section-dashboard', label: '首页总览' },
  { id: 'section-onsite', label: '现场服务' },
  { id: 'section-customer', label: '客户资产' },
  { id: 'section-support', label: '系统支持' },
  { id: 'section-next', label: '下一步' }
];

const timelineData = [
  {
    title: '01 需求受理',
    description: '客户通过客服热线 / 企业微信 / 自助门户报修，录入设备、故障、紧急程度等信息。系统自动校验保修与 SLA。',
    tags: ['客户信息', 'SLA 校验', '故障分类']
  },
  {
    title: '02 派单调度',
    description: '调度员根据区域、技能标签、当前负载一键派单。支持短信 / App 推送通知工程师接单。',
    tags: ['智能派单', '技能匹配', '消息通知']
  },
  {
    title: '03 工程师接单准备',
    description: '工程师确认预约时间，查看客户档案、历史工单、所需备件清单，并提前领取备件。',
    tags: ['客户档案', '备件领取', '预约确认']
  },
  {
    title: '04 上门执行',
    description: '到场签到，执行巡检、故障定位、维修处理；现场拍照留存，实时更新工单状态。',
    tags: ['签到', '现场记录', '进度更新']
  },
  {
    title: '05 完工与确认',
    description: '提交维修结果、备件消耗，客户电子签名确认。同步生成服务报告并推送给客户。',
    tags: ['服务报告', '电子签名', '备件核销']
  },
  {
    title: '06 复盘与评价',
    description: '客户评价满意度，后台监控一次解决率、费用情况。必要时触发回访或再派单。',
    tags: ['满意度', '质量监控', '回访']
  }
];

const tickets = [
  {
    id: 'ES-20230418-01',
    customer: '腾云科技（总部）',
    issue: '财务打印机无法连接共享服务器',
    engineer: '张帅',
    status: 'onsite',
    appointment: '10:30 今日'
  },
  {
    id: 'ES-20230418-02',
    customer: '星辉广告有限公司',
    issue: 'MacBook Pro 蓝屏，疑似内存故障',
    engineer: '李倩',
    status: 'in-progress',
    appointment: '09:00 今日'
  },
  {
    id: 'ES-20230418-03',
    customer: '诚信集团（天津分部）',
    issue: '新员工电脑初始化安装软件',
    engineer: '王磊',
    status: 'pending',
    appointment: '16:00 今日'
  },
  {
    id: 'ES-20230418-04',
    customer: '北辰物流',
    issue: '售后系统登录缓慢，需要现场排查',
    engineer: '赵敏',
    status: 'onsite',
    appointment: '14:00 今日'
  }
];

const stats = [
  { label: '今日工单总数', value: '28', trend: '+12% 较昨日' },
  { label: '平均响应时长', value: '32m', trend: '+5% SLA 达标' },
  { label: '一次修复率', value: '92%', trend: '+3% 本周' },
  { label: '客户满意度', value: '4.8 / 5', trend: 'NPS 67' }
];

const checklistItems = [
  '确认预约路线与交通时间',
  '核对客户资产与保修状态',
  '检查随身工具及备件齐全',
  '与客户确认现场安全注意事项'
];

const stockAlerts = [
  { name: 'ThinkPad 电源适配器 65W', qty: '库存 3', alert: '建议补货' },
  { name: 'Dell 原装内存 8G', qty: '库存 5', alert: '余量正常' },
  { name: '惠普硒鼓 CF217A', qty: '库存 2', alert: '紧急采购' }
];

const onsiteSteps = [
  {
    title: '到场签到',
    description: '手机 App 一键签到，自动记录时间和地理位置，通知调度中心工程师已到场。'
  },
  {
    title: '信息核对',
    description: '与客户确认设备、故障、联系人信息，核对保修与费用授权。'
  },
  {
    title: '故障处理',
    description: '按照知识库步骤排查，记录关键操作点并拍照上传。'
  },
  {
    title: '测试验证',
    description: '维修完成后进行多轮验证，确认设备恢复正常并记录结果。'
  },
  {
    title: '客户确认',
    description: '客户在 App 端签字确认，选择满意度并填写评价。'
  },
  {
    title: '报告提交',
    description: '提交备件消耗、工时、费用信息，系统自动生成服务报告并回传后台。'
  }
];

const customerProfile = {
  name: '腾云科技（总部）',
  contact: '张琳 · IT 主管 · 138-xxxx-6420',
  address: '北京市朝阳区望京东路 15 号望京科技园 A 座 12 层',
  sla: '企业 VIP · 4 小时响应 / 24 小时解决',
  notes: '核心客户，需定期巡检；对备件到货速度有较高要求。',
  devices: [
    { model: 'ThinkPad T16', sn: 'PC-8890-23', status: '在保', lastService: '2023-03-05' },
    { model: 'HP LaserJet M428', sn: 'PR-4412-07', status: '在保', lastService: '2023-02-20' },
    { model: 'Dell 显示器 P2721', sn: 'DS-7711-02', status: '过保', lastService: '2022-11-28' }
  ]
};

const historyRecords = [
  {
    title: '2023-03-05 · 打印机卡纸处理',
    detail: '更换定影组件，客户评价 5 星，建议增加易耗件库存。'
  },
  {
    title: '2023-01-18 · PC 巡检',
    detail: '批量升级系统补丁，优化启动项，提出网络改造建议。'
  },
  {
    title: '2022-12-02 · 显示器色彩偏差',
    detail: '校准色彩并提供校色报告，客户满意度 4 星。'
  }
];

const sidebarNav = document.getElementById('sidebarNav');
const timeline = document.getElementById('timeline');
const statsContainer = document.getElementById('stats');
const ticketTable = document.querySelector('#ticketTable tbody');
const mobileTickets = document.getElementById('mobileTickets');
const checklist = document.getElementById('checklist');
const stockList = document.getElementById('stockList');
const stepper = document.getElementById('stepper');
const customerCard = document.getElementById('customerCard');
const history = document.getElementById('history');

function initSidebarNav() {
  sections.forEach((section) => {
    const link = document.createElement('a');
    link.href = `#${section.id}`;
    link.textContent = section.label;
    sidebarNav.appendChild(link);
  });
}

function renderTimeline() {
  timelineData.forEach((item) => {
    const block = document.createElement('article');
    block.className = 'timeline-item';

    const title = document.createElement('h4');
    title.textContent = item.title;
    block.appendChild(title);

    const desc = document.createElement('p');
    desc.textContent = item.description;
    block.appendChild(desc);

    const tagList = document.createElement('div');
    tagList.className = 'timeline-tags';
    item.tags.forEach((tag) => {
      const chip = document.createElement('span');
      chip.textContent = tag;
      tagList.appendChild(chip);
    });
    block.appendChild(tagList);

    timeline.appendChild(block);
  });
}

function renderStats() {
  stats.forEach((item) => {
    const card = document.createElement('article');
    card.className = 'stat-card';

    const label = document.createElement('h4');
    label.textContent = item.label;
    card.appendChild(label);

    const value = document.createElement('strong');
    value.textContent = item.value;
    card.appendChild(value);

    const trend = document.createElement('span');
    trend.className = 'stat-trend';
    trend.textContent = item.trend;
    card.appendChild(trend);

    statsContainer.appendChild(card);
  });
}

function renderTickets(filter = 'all') {
  ticketTable.innerHTML = '';
  mobileTickets.innerHTML = '';

  const filtered = tickets.filter((ticket) => filter === 'all' || ticket.status === filter);

  filtered.forEach((ticket) => {
    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${ticket.id}</td>
      <td>${ticket.customer}</td>
      <td>${ticket.issue}</td>
      <td>${ticket.engineer}</td>
      <td><span class="badge ${ticket.status}">${statusLabel(ticket.status)}</span></td>
      <td>${ticket.appointment}</td>
    `;
    ticketTable.appendChild(row);

    const tile = document.createElement('li');
    tile.className = 'device-ticket';
    tile.innerHTML = `
      <div class="device-ticket-header">
        <span>${ticket.customer}</span>
        <span class="badge ${ticket.status}">${statusLabel(ticket.status)}</span>
      </div>
      <div>${ticket.issue}</div>
      <div class="device-ticket-meta">工单号 ${ticket.id} · ${ticket.appointment}</div>
    `;
    mobileTickets.appendChild(tile);
  });
}

function statusLabel(status) {
  switch (status) {
    case 'onsite':
      return '待上门';
    case 'in-progress':
      return '进行中';
    case 'pending':
      return '待反馈';
    default:
      return status;
  }
}

function initFilters() {
  const chips = document.querySelectorAll('.chip');
  chips.forEach((chip) => {
    chip.addEventListener('click', () => {
      chips.forEach((item) => item.classList.remove('active'));
      chip.classList.add('active');
      renderTickets(chip.dataset.filter);
    });
  });
}

function renderChecklist() {
  checklistItems.forEach((item, index) => {
    const li = document.createElement('li');
    li.innerHTML = `<span>${index + 1}</span>${item}`;
    checklist.appendChild(li);
  });
}

function renderStock() {
  stockAlerts.forEach((stock) => {
    const item = document.createElement('li');
    item.className = 'stock-item';
    item.innerHTML = `<strong>${stock.name}</strong><span>${stock.qty} · ${stock.alert}</span>`;
    stockList.appendChild(item);
  });
}

function renderStepper() {
  onsiteSteps.forEach((step, index) => {
    const card = document.createElement('article');
    card.className = 'step-card';
    card.dataset.step = `STEP ${index + 1}`;
    card.innerHTML = `
      <h4>${step.title}</h4>
      <p>${step.description}</p>
    `;
    stepper.appendChild(card);
  });
}

function renderCustomer() {
  customerCard.innerHTML = `
    <h4>${customerProfile.name}</h4>
    <div class="customer-meta">
      <div><span>联系人</span><strong>${customerProfile.contact}</strong></div>
      <div><span>地址</span><strong>${customerProfile.address}</strong></div>
      <div><span>SLA</span><strong>${customerProfile.sla}</strong></div>
    </div>
    <p>${customerProfile.notes}</p>
    <div class="device-table">
      <table>
        <thead>
          <tr>
            <th>设备型号</th>
            <th>序列号</th>
            <th>保修状态</th>
            <th>最近服务</th>
          </tr>
        </thead>
        <tbody>
          ${customerProfile.devices
            .map(
              (device) => `
                <tr>
                  <td>${device.model}</td>
                  <td>${device.sn}</td>
                  <td>${device.status}</td>
                  <td>${device.lastService}</td>
                </tr>
              `
            )
            .join('')}
        </tbody>
      </table>
    </div>
  `;

  history.innerHTML = `
    <h4>历史服务记录</h4>
    <ul class="history-list">
      ${historyRecords
        .map(
          (record) => `
            <li class="history-item">
              <strong>${record.title}</strong>
              <span>${record.detail}</span>
            </li>
          `
        )
        .join('')}
    </ul>
  `;
}

function initHeroActions() {
  const buttons = document.querySelectorAll('[data-scroll]');
  buttons.forEach((btn) => {
    btn.addEventListener('click', () => {
      const target = document.getElementById(btn.dataset.scroll);
      if (target) {
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    });
  });
}

function initScrollSpy() {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        const link = sidebarNav.querySelector(`a[href="#${entry.target.id}"]`);
        if (link) {
          if (entry.isIntersecting) {
            sidebarNav.querySelectorAll('a').forEach((item) => item.classList.remove('active'));
            link.classList.add('active');
          }
        }
      });
    },
    {
      rootMargin: '-40% 0px -40% 0px'
    }
  );

  sections.forEach((section) => {
    const el = document.getElementById(section.id);
    if (el) {
      observer.observe(el);
    }
  });
}

function init() {
  initSidebarNav();
  renderTimeline();
  renderStats();
  renderTickets();
  initFilters();
  renderChecklist();
  renderStock();
  renderStepper();
  renderCustomer();
  initHeroActions();
  initScrollSpy();
}

init();
