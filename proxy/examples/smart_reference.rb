# Smart reference is a replacement for a bare pointer that performs additional ations when object is accessed.

class HeavyCalculate
  def calculate
  end
end

class MemoizeHeavyCalculate
  def calculate
    @calculate ||= calculator.calculate
  end

  private

  def calculator
    @calculator ||= HeavyCalculate.calculate
  end
end
