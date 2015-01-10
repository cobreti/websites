#ifndef _NYXSYSTEM_HPP_
#define _NYXSYSTEM_HPP_

#include "NyxTypes.hpp"

#include <Windows.h>


namespace Nyx
{
	/**
	 *	\brief		Class wrapping platform system calls
	 */
	class CSystem
	{
	public: // public functions
		CSystem() {}
		~CSystem() {}

		/**
		 *	\brief		Wait for the specified time
		 *	\param		unMillisec : time in milliseconds
		 */
		void Sleep( const Nyx::UInt32& unMillisec )
		{
			::Sleep(unMillisec);
		}


	private: // private functions

		// disable copy-constructor
		CSystem(const Nyx::CSystem&);
	};
}


#endif // _NYXSYSTEM_HPP_
