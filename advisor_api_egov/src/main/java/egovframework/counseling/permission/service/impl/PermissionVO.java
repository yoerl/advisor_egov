package egovframework.counseling.permission.service.impl;

    public class PermissionVO {
     
    	  public String getCpu() {
			return cpu;
		}

		public void setCpu(String cpu) {
			this.cpu = cpu;
		}

		public String getMemory() {
			return memory;
		}

		public void setMemory(String memory) {
			this.memory = memory;
		}

		public String getDisk() {
			return disk;
		}

		public void setDisk(String disk) {
			this.disk = disk;
		}

		@Override
		public String toString() {
			return "PermissionVO [cpu=" + cpu + ", memory=" + memory + ", disk=" + disk + "]";
		}

		private String cpu;
    	  
    	  private String memory;
    	  
    	  private String disk;
    }
