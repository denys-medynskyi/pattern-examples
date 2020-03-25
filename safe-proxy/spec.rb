require 'rspec/autorun'
require_relative 'service'
require_relative 'safe_service'

describe SafeService do
  it 'delegates perform' do
    service = instance_double('Service', perform: true)
    safe_service = SafeService.new(service)

    safe_service.perform

    expect(service).to have_received(:perform)
  end

  it 'passes arguments' do
    service = instance_double('Service', perform: true)
    safe_service = SafeService.new(service)

    safe_service.perform('foo', 'bar')

    expect(service).to have_received(:perform).with('foo', 'bar')
  end

  it 'passes on return values' do
    service = instance_double('Service', perform: result = double('result'))
    safe_service = SafeService.new(service)

    expect(safe_service.perform).to eq(result)
  end

  context 'when exception raised' do
    it 'return empty array' do
      service = instance_double('Service')
      allow(service).to receive(:perform).and_raise(StandardError)
      safe_service = SafeService.new(service)

      expect(safe_service.perform).to eq([])
    end

    it 'prevents standard exception from failing method' do
      service = instance_double('Service')
      allow(service).to receive(:perform).and_raise(StandardError)

      safe_service = SafeService.new(service)

      expect { safe_service.perform }.not_to raise_error
    end

    it 'passes non standard exception from failing method' do
      service = instance_double('Service')
      allow(service).to receive(:perform).and_raise(Exception)

      safe_service = SafeService.new(service)

      expect { safe_service.perform }.to raise_error(Exception)
    end

    it 'calls on_error handler with error, method name and arguments' do
      service = instance_double('Service')
      handler = double('on_error handler', call: nil)
      error = StandardError
      allow(service).to receive(:perform).and_raise(error)
      safe_service = SafeService.new(service, on_error: handler)

      safe_service.perform('foo', 'bar')

      expect(handler).to have_received(:call).with(error, :perform, ['foo', 'bar'])
    end
  end
end
